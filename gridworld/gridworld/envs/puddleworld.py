
import gym
from gym import spaces
from gym.utils import seeding
import numpy as np
import random
# ********************************* Action set ******************************************
NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3
# ********************* Various puddle areas identification ******************************
shallow_puddle_positions = {27, 28, 29, 30, 31,   32,
                            39,                   44,
                            51,                   56,
                            63,                   68,
                            75,                79,80,               # REMOVE 79 WHEN C IS TERMINAL STATE
                            87,                91,
                            99, 100, 101, 102, 103}

medium_puddle_positions = {40, 41, 42, 43,
                           52,         55,
                           64,     66, 67,
                           76,     78,
                           88, 89, 90}

deep_puddle_positions = {53, 54,
                         65,
                         77}

# ********************************* Environment Initialization ******************************************
class PuddleEnv(gym.Env):
    metadata = {'render.modes': ['human']}

    def __init__(self, n=12, m=12, random_move=0.1 + 0.1 / 3, terminal_reward=10.0,
                 step_reward=0.0, starting_position=random.choice([60, 72, 120, 132]), east_wind=0.5,
                 shallow_puddle__reward=-1, medium_puddle__reward=-2, deep_puddle__reward=-3,
                 A=11, B=33, C=79):
        self.new_position = None
        self.n = n                                            # grid row size
        self.m = m                                            # grid column size
        self.uncertainty = random_move                        # uncertainty of 0.1 in action movement
        self.wind = east_wind                                 # gentle Westerly wind
        self.terminal_reward = terminal_reward                # terminal and step rewards
        self.step_reward = step_reward
        self.no_of_states = self.n * self.m + 1               # total state plus one absorbing state
        self.terminal_state = A                               # TERMINAL STATE DECLARATION FOR THREE VARIANTS*******
        self.absorbing_state = self.no_of_states - 1          # absorbing state is numbered as 144
        self.shallow_puddle__reward = shallow_puddle__reward  # reward for different puddle areas
        self.medium_puddle__reward = medium_puddle__reward
        self.deep_puddle__reward = deep_puddle__reward
        self.done = False                                     # stopping criteria
        self.start_state = starting_position
        self.state = None
        self.reset()

        self.action_set = spaces.Discrete(4)
        self.observation_set = spaces.Discrete(self.no_of_states)
        self._seed()

    # ********************************* Function Definition ******************************************
    def _seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    def step(self, action):
        assert self.action_set.contains(action)

        if self.state == self.terminal_state:
            self.state = self.absorbing_state                # transform to absorbing state when terminal state reached
            self.done = True                                 # stop the episode
            return self.state, self._reward(), self.done, None

        [row, col] = self.index2row_col(index=self.state)    # converting row column to state number

        if np.random.rand() < self.uncertainty:              # pick action randomly with probability 0.1+0.1/3
            action = self.action_set.sample()

        if action == NORTH:
            row = max(row - 1, 0)                            # otherwise pick action as chosen
        elif action == SOUTH:
            row = min(row + 1, self.n - 1)
        elif action == EAST:
            col = min(col + 1, self.m - 1)
        elif action == WEST:
            col = max(col - 1, 0)

        if np.random.rand() < self.wind:                  # movement due to gentle Westerly wind
            col = min(col + 1, self.m - 1)                # TURN OFF WIND FOR C

        new_position = self.row_col2index([row, col])

        reward = self._reward()

        self.state = new_position                           # next state and reward calculation

        return self.state, reward, self.done, None

    def _reward(self, new_position=None):
        if self.done:
            return self.terminal_reward

        reward = self.step_reward

        if self.state in shallow_puddle_positions:       # negative reward for stepping into the puddle
            reward = self.shallow_puddle__reward
        if self.state in medium_puddle_positions:
            reward = self.medium_puddle__reward
        if self.state in deep_puddle_positions:
            reward = self.deep_puddle__reward

        return reward

    def index2row_col(self, index=None):                  # state number to row column conversion

        row = index // self.n
        col = index - row * self.n
        return [row, col]

    def row_col2index(self, position):                   # row column to state number conversion
        [row, col] = position
        assert (row < self.n)
        assert (col < self.n)
        return row * self.n + col

    def reset(self):                                    # resetting new episode
        if self.state == self.absorbing_state:
            self.done = False

        self.state = random.choice([60, 72, 120, 132])  # starting state assignment in each new episode
        return self.state

    def _render(self, mode='human', close=False):       # passing render
        pass
