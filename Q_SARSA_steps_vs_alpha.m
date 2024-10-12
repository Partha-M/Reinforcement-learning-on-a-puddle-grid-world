%%Plotting average steps in last episode for Q and SARSA vs alpha
clc
n=11;
%% Load Data for Q Learning
load ('Q_learning_A.mat')
xA1=learning_rates;
%arA1=smooth(average_steps,n,'sgolay');
asA1=average_steps;
load ('Q_learning_B.mat')
xB1=time_steps;
asB1=average_steps;
load ('Q_learning_C.mat')
xC1=time_steps;
asC1=average_steps;

%% Load Data for SARSA Learning
load ('SARSA_learning_A.mat')
xA2=learning_rates;
asA2=average_steps;
load ('SARSA_learning_B.mat')
xB2=time_steps;
asB2=average_steps;
load ('SARSA_learning_C.mat')
xC2=time_steps;
asC2=average_steps;

%% Average numbers of steps vs learning rate \alpha for Q
figure(1)
plot(xA1,asA1,'g')
xlabel('Learning rate \alpha')
ylabel('Average steps in the last episode')
%title('Average steps for different learning rates')
hold on
plot(xA1,asB1,'r')
plot(xA1,asC1,'b')
xlim([0.1 1])
ylim([0 100])
lgd=legend('Terminal state A','Terminal state B','Terminal state C');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Average numbers of steps vs learning rate \alpha for SARSA
figure(2)
plot(xA2,asA2,'g')
xlabel('Learning rate \alpha')
ylabel('Average steps in the last episode')
%title('Average steps for different learning rates')
hold on
plot(xA2,asB2,'r')
plot(xA2,asC2,'b')
xlim([0.1 1])
ylim([0 100])
lgd=legend('Terminal state A','Terminal state B','Terminal state C');
lgd.FontSize = 10;
lgd.Location='south east';
hold off
