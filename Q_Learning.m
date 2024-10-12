%%Plotting learning curves for Q-learning
clc
n=11;
%% Load Data for Terminal State A
load ('Q_learning_0_1_A.mat')
xA1=time_steps;
arA1=smooth(average_rewards,n,'sgolay');
asA1=average_steps;
load ('Q_learning_0_5_A.mat')
xA5=time_steps;
arA5=smooth(average_rewards,n,'sgolay');
asA5=average_steps;
load ('Q_learning_0_9_A.mat')
xA9=time_steps;
arA9=smooth(average_rewards,n,'sgolay');
asA9=average_steps;

%% Load Data for Terminal State B
load ('Q_learning_0_1_B.mat')
xB1=time_steps;
arB1=smooth(average_rewards,n,'sgolay');
asB1=average_steps;
load ('Q_learning_0_5_B.mat')
xB5=time_steps;
arB5=smooth(average_rewards,n,'sgolay');
asB5=average_steps;
load ('Q_learning_0_9_B.mat')
xB9=time_steps;
arB9=smooth(average_rewards,n,'sgolay');
asB9=average_steps;

%% Load Data for Terminal State C
load ('Q_learning_0_1_C.mat')
xC1=time_steps;
arC1=smooth(average_rewards,n,'sgolay');
asC1=average_steps;
load ('Q_learning_0_5_C.mat')
xC5=time_steps;
arC5=smooth(average_rewards,n,'sgolay');
asC5=average_steps;
load ('Q_learning_0_9_C.mat')
xC9=time_steps;
arC9=smooth(average_rewards,n,'sgolay');
asC9=average_steps;

%% Comparision Average Reward Plots of Q-Learning for Terminal State A
figure(1)
plot(xA1,arA1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xA1,arA5,'r')
plot(xA1,arA9,'b')
xlim([-10 1000])
ylim([-4 10])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Steps Plots of Q-Learning for Terminal State A
figure(2)
plot(xA1,asA1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xA1,asA5,'r')
plot(xA1,asA9,'b')
xlim([-10 1000])
ylim([0 50])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Reward Plots of Q-Learning for Terminal State B
figure(3)
plot(xB1,arB1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xB1,arB5,'r')
plot(xB1,arB9,'b')
xlim([-10 1000])
ylim([-4 10])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off
%% Comparision Average Steps Plots of Q-Learning for Terminal State B
figure(4)
plot(xB1,asB1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xB1,asB5,'r')
plot(xB1,asB9,'b')
xlim([-10 1000])
ylim([0 200])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Reward Plots of Q-Learning for Terminal State C
figure(5)
plot(xC1,arC1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xC1,arC5,'r')
plot(xC1,arC9,'b')
xlim([-10 1000])
ylim([-4 10])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Steps Plots of Q-Learning for Terminal State C
figure(6)
plot(xC1,asC1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xC1,asC5,'r')
plot(xC1,asC9,'b')
xlim([-10 1000])
ylim([0 200])
xticks([250 500 750 1000])
lgd=legend('\alpha =0.1','\alpha =0.5','\alpha =0.9');
lgd.FontSize = 10;
lgd.Location='south east';
hold off


