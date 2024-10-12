%%Plotting learning curves for SARSA lambda
clc
n=11;
%% Load Data for Terminal State A
load ('SARSA_lambda_0_0_A')
xA1=time_steps;
arA1=smooth(average_rewards,n,'sgolay');
asA1=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_3_A')
xA3=time_steps;
arA3=smooth(average_rewards,n,'sgolay');
asA3=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_5_A')
xA5=time_steps;
arA5=smooth(average_rewards,n,'sgolay');
asA5=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_9_A')
xA9=time_steps;
arA9=smooth(average_rewards,n,'sgolay');
asA9=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_99_A')
xA99=time_steps;
arA99=smooth(average_rewards,n,'sgolay');
asA99=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_1_0_A')
xA10=time_steps;
arA10=smooth(average_rewards,n,'sgolay');
asA10=smooth(average_steps,n,'sgolay');

%% Load Data for Terminal State B
load ('SARSA_lambda_0_0_B')
xB1=time_steps;
arB1=smooth(average_rewards,n,'sgolay');
asB1=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_3_B')
xB3=time_steps;
arB3=smooth(average_rewards,n,'sgolay');
asB3=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_5_B')
xB5=time_steps;
arB5=smooth(average_rewards,n,'sgolay');
asB5=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_9_B')
xB9=time_steps;
arB9=smooth(average_rewards,n,'sgolay');
asB9=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_99_B')
xB99=time_steps;
arB99=smooth(average_rewards,n,'sgolay');
asB99=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_1_0_B')
xB10=time_steps;
arB10=smooth(average_rewards,n,'sgolay');
asB10=smooth(average_steps,n,'sgolay');

%% Load Data for Terminal State C
load ('SARSA_lambda_0_0_C')
xC1=time_steps;
arC1=smooth(average_rewards,n,'sgolay');
asC1=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_3_C')
xC3=time_steps;
arC3=smooth(average_rewards,n,'sgolay');
asC3=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_5_C')
xC5=time_steps;
arC5=smooth(average_rewards,n,'sgolay');
asC5=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_9_C')
xC9=time_steps;
arC9=smooth(average_rewards,n,'sgolay');
asC9=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_0_99_C')
xC99=time_steps;
arC99=smooth(average_rewards,n,'sgolay');
asC99=smooth(average_steps,n,'sgolay');
load ('SARSA_lambda_1_0_C')
xC10=time_steps;
arC10=smooth(average_rewards,n,'sgolay');
asC10=smooth(average_steps,n,'sgolay');

%% Comparision Average Reward Plots of SARSA lambda for Terminal State A
figure(1)
plot(xA1,arA1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xA1,arA3,'r')
plot(xA1,arA5,'b')
plot(xA1,arA9,'m')
plot(xA1,arA99,'c')
plot(xA1,arA10,'k')
xlim([-10 1000])
ylim([-2 10])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Steps Plots of SARSA lambda for Terminal State A
figure(2)
plot(xA1,asA1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xA1,asA3,'r')
plot(xA1,asA5,'b')
plot(xA1,asA9,'m')
plot(xA1,asA99,'c')
plot(xA1,asA10,'k')
xlim([-10 1000])
ylim([0 80])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Reward Plots of SARSA lambda for Terminal State B
figure(3)
plot(xB1,arB1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xB1,arB3,'r')
plot(xB1,arB5,'b')
plot(xB1,arB9,'m')
plot(xB1,arB99,'c')
plot(xB1,arB10,'k')
xlim([-10 1000])
ylim([-2 10])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Steps Plots of SARSA lambda for Terminal State B
figure(4)
plot(xB1,asB1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xB1,asB3,'r')
plot(xB1,asB5,'b')
plot(xB1,asB9,'m')
plot(xB1,asB99,'c')
plot(xB1,asB10,'k')
xlim([-10 1000])
ylim([0 80])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Reward Plots of SARSA lambda for Terminal State C
figure(5)
plot(xC1,arC1,'g')
xlabel('Episodes')
ylabel('Average Rewards')
%title('Average rewards for different learning rates')
hold on
plot(xC1,arC3,'r')
plot(xC1,arC5,'b')
plot(xC1,arC9,'m')
plot(xC1,arC99,'c')
plot(xC1,arC10,'k')
xlim([-10 1000])
ylim([-2 10])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off

%% Comparision Average Steps Plots of SARSA lambda for Terminal State C
figure(6)
plot(xC1,asC1,'g')
xlabel('Episodes')
ylabel('Average number of steps')
%title('Average steps for different learning rates')
hold on
plot(xC1,asC3,'r')
plot(xC1,asC5,'b')
plot(xC1,asC9,'m')
plot(xC1,asC99,'c')
plot(xC1,asC10,'k')
xlim([-10 1000])
ylim([0 300])
xticks([250 500 750 1000])
lgd=legend('\lambda =0.0','\lambda =0.3','\lambda =0.5','\lambda =0.9','\lambda =0.99','\lambda =1.0');
lgd.FontSize = 10;
lgd.Location='south east';
hold off
