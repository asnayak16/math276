%% Michaelis-Menten Reactions ODE Solutions
%%% Ashwin Nayak, z25-Feb-2017
%%% Written towards MATH276 HW3
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%%% Solves the M-M Reactions,
% % %         | S |          | -k_1*E*S + k_1*C           |
% % %   Z =   | E |, dZ_dt = | -k_1*E*S + k_m1*C + k_2*C  |
% % %         | C |          |  k_1*E*S - k_m1*C - k_2*C  |
% % %         | P |          |  k_2*C                     |
%%% Using the RK method
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

%% Initial Conditions
   % Rate Constants
   k_1 = 1e3;   k_m1 = 1;
   k_2  = 0.05;
   
   % Initial Concentrations
   Z0 = [  ;
           ;
           ;
           ];
   
   % Time Step
   dt = 1e-6;
   
   % Solver options
   
%% Solve
   
%% Output
