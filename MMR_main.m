%% Michaelis-Menten Reactions ODE Solutions
%%% Ashwin Nayak, 25-Feb-2017
%%% Written towards MATH276 HW3
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%%% Solves the M-M Reactions,
% % %          S + E <===> C ---> E + P 
% % %  ODE : 
% % %         | S |          | -k_1*E*S + k_1*C           |
% % %   Z =   | E |, dZ_dt = | -k_1*E*S + k_m1*C + k_2*C  |
% % %         | C |          |  k_1*E*S - k_m1*C - k_2*C  |
% % %         | P |          |  k_2*C                     |
%%% Using MATLAB's ode23s solver.
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%% Initial Conditions
   % Rate Constants
   k_1 = 7.5;   k_m1 = 50; k_2  = 0.05;

   % Initial Concentrations
   Z0 = [  0.008; 0.75; 0 ; 0 ];
   
   % Solver options
   tspan = [0 100];
   ode_fn = @(t,Z) MMR_ode(t,Z,k_1,k_m1,k_2);    

%% Solve
   [t,Z] = ode23s(ode_fn,tspan,Z0);

%% Output plots
   subplot(2,2,1), loglog(t,Z(:,1)), ylabel('C[S]')
   subplot(2,2,2), loglog(t,Z(:,2)), ylabel('C[E]')
   subplot(2,2,3), loglog(t,Z(:,3)), ylabel('C[C]')
   subplot(2,2,4), loglog(t,Z(:,4)), ylabel('C[P]')
   
%% M-M ODE Function
function dz_dt = MMR_ode(t,z,k_1,k_m1,k_2) 
dz_dt = [ -k_1*z(1)*z(2) + k_1*z(3);
          -k_1*z(1)*z(2) + k_m1*z(3) + k_2*z(3);
           k_1*z(1)*z(2) - k_m1*z(3) - k_2*z(3);
           k_2*z(3);                            
        ];
end
