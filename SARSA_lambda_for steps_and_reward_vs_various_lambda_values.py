import numpy as np
import gym
import matplotlib.pyplot as plt
import scipy.io as sio
import gridworld                    # Import gridworld environment

# ****************************** Loading Environment ****************************************
env = gym.make('GridWorld-v0')


# *********************************  Parameter Initialization*********************************
alpha = 0.1
gamma = 0.9
min_lmd = 0.0
max_lmd = 1.0
lmd = min_lmd
lmd_change = 0.05
episode = 1000
epsilon = 0.5
min_epsilon = 0.0
max_step = 1000
loop_times = 50
average_steps_in_last_episode = []
average_reward_in_last_episode = []

reduction = (epsilon - min_epsilon) / episode   # decrease exploration with episode
lmd_values = []
while lmd <= max_lmd:
    steps = 0
    Reward = 0
    for k in range(loop_times):
        Q = np.zeros([env.observation_set.n, env.action_set.n])  # Q table initialization
        e = np.zeros([env.observation_set.n, env.action_set.n])  # Eligibility trace initialization to zero
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
                e[state, action] += 1

                if np.random.random() < 1 - epsilon:
                    next_action = np.argmax(Q[next_state, :])
                else:
                    next_action = np.random.randint(0, env.action_set.n)
                delta = (reward1 + gamma * (Q[next_state, next_action]) - Q[state, action])   # updating Q table
                Q += alpha * delta * e
                state = next_state
                action = next_action
                e = lmd * gamma * e                                        # update eligibility trace

                if step >= max_step:                                       # stop if maximum step size is reached
                    done = True

                if done:
                    break

            if epsilon > min_epsilon:                                   # decreasing epsilon for less exploration
                epsilon -= reduction
        steps += step
        Reward += reward
    average_steps_in_last_episode.append((steps / loop_times))     # average reward and step in last episode calculation
    average_reward_in_last_episode.append((Reward / loop_times))
    lmd_values.append(lmd)                                         # append different lambda values
    print(lmd)
    lmd += lmd_change                                              # increase lambda from 0.0 to 1
    lmd = round(lmd, 2)                                            # round off values

   

# Plot rewards and steps per episode
# NAME MATLAB DATA FILE SAME AS LOADING FILE FOR PLOTTING IN MATLAB
sio.savemat('SARSA_lambda_C.mat',{'lambda_lists': lmd_values, 'average_rewards':average_reward_in_last_episode,'average_steps':average_steps_in_last_episode})
plt.subplot(2, 1, 1)
plt.plot(lmd_values, average_steps_in_last_episode)
plt.ylim(0, 300)
plt.xlabel('lambda')
plt.ylabel('Average steps to reach the terminal state')
plt.subplot(2, 1, 2)
plt.plot(lmd_values, average_reward_in_last_episode)

plt.xlabel('lambda')
plt.ylabel('Average reward to reach the terminal state')
plt.ylim(-4, 10)
plt.show()










