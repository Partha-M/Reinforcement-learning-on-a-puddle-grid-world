clc
n=11;
%% Load Data for Q Learning
load ('SARSA_lambda_A.mat')
xA1=lambda_lists;
arA1= average_rewards;
asA1=average_steps;
load ('SARSA_lambda_B.mat')
xB1=lambda_lists;
arB1= average_rewards;
asB1=average_steps;
load ('SARSA_lambda_C.mat')
xC1=lambda_lists;
arC1= average_rewards;
asC1=average_steps;

%% Average reward vs \lambda for SARSA \lambda
figure(1)
plot(xA1,arA1,'go')
xlabel('\lambda')
ylabel('Average reward in the last episode')
%title('Average steps for different learning rates')
hold on
plot(xA1,arB1,'r--')
plot(xA1,arC1,'b*')
xlim([0.0 1])
ylim([0 12])
lgd=legend('Terminal state A','Terminal state B','Terminal state C');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Average numbers of steps vs \lambda for SARSA \lambda
figure(2)
plot(xA1,asA1,'go')
xlabel('\lambda')
ylabel('Average steps in the last episode')
%title('Average steps for different learning rates')
hold on
plot(xA1,asB1,'r--')
plot(xA1,asC1,'b*')
xlim([0.0 1])
ylim([0 300])
lgd=legend('Terminal state A','Terminal state B','Terminal state C');
lgd.FontSize = 10;
lgd.Location='south east';
hold off
