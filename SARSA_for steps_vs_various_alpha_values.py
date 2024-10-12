import numpy as np
import gym
import matplotlib.pyplot as plt
import scipy.io as sio
import gridworld            # Import gridworld environment

# ****************************** Loading Environment ****************************************
env = gym.make('GridWorld-v0')

# *********************************  Parameter Initialization*********************************
min_alpha = 0.1
max_alpha = 1.0
alpha = min_alpha
alpha_change = 0.01
gamma = 0.9
episode = 1000
epsilon = 0.5
min_epsilon = 0.0
max_step = 1000
loop_times = 50
average_steps_in_last_episode = []

reduction = (epsilon - min_epsilon) / episode     # decrease exploration with episode

alpha_values = []
total_avg_steps = 0
total_avg_reward = 0
while alpha <= max_alpha:
    steps = 0
    for k in range(loop_times):
        Q = np.zeros([env.observation_set.n, env.action_set.n])    # Q table initialization
        total_reward = 0
        total_steps = 0
        epsilon = 0.5
        for i in range(episode):
            # Initialize parameters
            done = False
            reward = 0
            step = 0
            state = env.reset()                                  # resetting episode
            if np.random.random() < 1 - epsilon:                 # with 1-epsilon probability choose maximizing action
                action = np.argmax(Q[state, :])
            else:
                action = np.random.randint(0, env.action_set.n)  # random action for exploration
            while not done:

                next_state, reward1, done, _ = env.step(action)   # get reward and next action
                step += 1
                reward += reward1

                if np.random.random() < 1 - epsilon:
                    next_action = np.argmax(Q[next_state, :])
                else:
                    next_action = np.random.randint(0, env.action_set.n)
                delta = alpha * (reward1 + gamma * (Q[next_state, next_action]) - Q[state, action]) # updating Q table
                Q[state, action] += delta
                state = next_state
                action = next_action

                if step >= max_step:                               # stop if maximum step size is reached
                    done = True

                if done:
                    break

            if epsilon > min_epsilon:                             # decreasing epsilon for less exploration
                epsilon -= reduction
        steps += step
    average_steps_in_last_episode.append((steps/loop_times))      # average reward in last episode calculation
    alpha_values.append(alpha)                                    # append different alpha values
    print(alpha)
    alpha += alpha_change                                         # increase alpha from 0.1 to 1
    alpha = round(alpha, 2)                                       # round off values


# Plot rewards and steps per episode
# NAME MATLAB DATA FILE SAME AS LOADING FILE FOR PLOTTING IN MATLAB
sio.savemat('SARSA_learning_B.mat',{'learning_rates': alpha_values, 'average_steps':average_steps_in_last_episode})

plt.plot(alpha_values, average_steps_in_last_episode)

plt.xlabel('Learning Rates')
plt.ylabel('Average steps to reach the terminal state')

plt.show()