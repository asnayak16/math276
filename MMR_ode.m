%% Michaelis-Menten Reactions ODE (Function)
%%% Ashwin Nayak, 25-Feb-2017
%%% Written towards MATH276 HW3
%%% = = = = =  = = = = = = = = = = = = = = = = = = = = = = = = = = 
% % %         | S |          | -k_1*E*S + k_1*C           |
% % %   Z =   | E |, dZ_dt = | -k_1*E*S + k_m1*C + k_2*C  |
% % %         | C |          |  k_1*E*S - k_m1*C - k_2*C  |
% % %         | P |          |  k_2*C                     |
%%% = = = = =  = = = = = = = = = = = = = = = = = = = = = = = = = = 
function dz_dt = MMR_ode(t,z,k_1,k_m1,k_2) 
dz_dt = [ -k_1*z(1)*z(2) + k_1*z(3);
          -k_1*z(1)*z(2) + k_m1*z(3) + k_2*z(3);
           k_1*z(1)*z(2) - k_m1*z(3) - k_2*z(3);
           k_2*z(3);                            
        ];
end
