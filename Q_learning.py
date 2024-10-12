import numpy as np
import gym
import matplotlib.pyplot as plt
import scipy.io as sio
import gridworld                   # Import gridworld environment

# ****************************** Loading Environment ****************************************
env = gym.make('GridWorld-v0')

# *********************************  Parameter Initialization*********************************
alpha = 0.9
gamma = 0.9
episode = 1000
epsilon = 0.5
min_epsilon = 0.0
max_step = 1000
loop_times = 50

avg_reward_in_episodes = np.zeros(episode)
avg_steps_in_episodes = np.zeros(episode)

reduction = (epsilon - min_epsilon) / episode  # decrease exploration with episode

total_avg_steps = 0
total_avg_reward = 0
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
        state = env.reset()                                    # resetting episode
        while not done:
            if np.random.random() < 1 - epsilon:               # with 1-epsilon probability choose maximizing action
                action = np.argmax(Q[state, :])
            else:
                action = np.random.randint(0, env.action_set.n)   # random action for exploration

            next_state, reward1, done, _ = env.step(action)       # get reward and next action
            step += 1
            reward += reward1

            delta = (reward1 + gamma * np.max(Q[next_state, :]) - Q[state, action])  # updating Q table
            Q[state, action] = Q[state, action] + alpha * delta
            state = next_state
            if step >= max_step:                     # stop if maximum step size is reached
                done = True
            if done:
                break
        avg_reward_in_episodes[i] += reward
        avg_steps_in_episodes[i] += step

        if epsilon > min_epsilon:                     # decreasing epsilon for less exploration
            epsilon -= reduction

    print(k)

avg_reward_in_episodes[:] = [x / loop_times for x in avg_reward_in_episodes]  # average reward and step calculation
avg_steps_in_episodes[:] = [x / loop_times for x in avg_steps_in_episodes]
x = np.linspace(1, episode + 1, episode)
# Plot rewards and steps per episode
# NAME MATLAB DATA FILE SAME AS LOADING FILE FOR PLOTTING IN MATLAB
sio.savemat('Q_learning_0_9_C.mat',{'time_steps': x, 'average_rewards':avg_reward_in_episodes,'average_steps':avg_steps_in_episodes})
plt.subplot(2, 1, 1)
plt.plot(x, avg_reward_in_episodes)
plt.xlabel('Episodes')
plt.ylabel('Average rewards per episodes')
plt.ylim(-4, 10)
plt.subplot(2, 1, 2)
plt.plot(x, avg_steps_in_episodes)
plt.xlabel('Episodes')
plt.ylabel('Average steps per episodes')
plt.show()