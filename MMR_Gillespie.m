%% Michaelis-Menten Reaction - Gillespie Algorithm
%%% Ashwin Nayak, asnayak(at)ucsd.edu, 25-Feb-2017
%%% Written towards MATH276 HW3
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%%% Solves the M-M Reactions,
% % %          S + E <===> C ---> E + P
%%% using the Gillespie Algorithm.
%%%
%%% 3 possible reactions : 
%%% (R1)    E + S --> C 
%%% (R2)    C --> E + S
%%% (R3)    C --> E + P
%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%% Initial Conditions
% Rate Constants
k_1 = 1e-3;   k_m1 = 1; k_2  = 0.05;

% Initial Species Populations
S = 3000; C = 0;
E = 1000; P = 0;

% Model Parameters
omega = 10;
t_f = 1000;

%% Simulation : Compute Transitions
w = nan(3,1);
results = nan(10000,5); t =0; iter = 0;
results(1,:) = [ t, S, E, C, P];
while(t<t_f)
    % Compute Transition probabilities (Propensity)
    w(1) = k_1*E*S/omega ;
    w(2) = k_m1*C;
    w(3) = k_2*C;
    
    % Compute Probability  of Reaction
    C_w = cumsum(w); % Cumulative Sum of propensities
    % P = w./C;     % Probability of reactions
    
    % Compute Reaction event
    r = rand()*C_w(end);   
    if ( r < C_w(1))      % R1 event occurs
        E=E-1;  S=S-1; C=C+1;  
    elseif ( r < C_w(2))  % R2 event occurs
        C=C-1; E=E+1; S=S+1;
    elseif ( r < C_w(3))  % R3 event occurs
        C=C-1; E=E+1; P=P+1;
    end
    
    % Compute Reaction Time
    dt = -log(rand())/C_w(end);
    t = t + dt;
    
    iter = iter+1;
    results(iter+1,:) = [ t, S, E, C, P];
end
results = results(1:iter+1,:);
%% Output Plots
% plot(results(:,1),results(:,2),'b',...
%       results(:,1),results(:,3),'g');
% xlabel('Time'); ylabel('Molecules of S(blue), E(green)');  
plot(results(:,1),results(:,3));