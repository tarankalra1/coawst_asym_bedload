clear all;  clc ; close all ; 

% Check logarithmic interpolation

%% Set up the grid and a velocity profile
% choose a water depth
h = 10;
% choose a reference elevation (I'd rather call this zref)
zref = 1.5;
% choose a number of levels
N=16;
% choose a zo apparent from M94...this could range up to as much as 2 -5 cm in rough bottoms
% and maybe get really big with cobble/boulder bottoms
z0 = 0.05; 
% make up a friction velocity so we can make a fake log profile
ustar = 0.2;
% make array of z_w faces from bottom to surface
z_w = linspace(0.,h,N+1);
% make array of z_r rho points between z_w
dz = diff(z_w);
z_r = z_w(1:end-1)+0.5*dz;
if(z_r(1)<=z0)
   error('This is a problem. Not sure what the model would do overall. Maybe set z0=0.5z_r(1)?')
end
% make a fake log profile
u = ustar/0.4*log(z_r/z0); % log profile


%plot(u,z_r,'+')
%xlim([0 4])
%ylim([0 h])

%% Do the interpolation and plot the interpolated velocity
% option 1
if(0) % option 1 - this allows log profile to continue smoothly to 0 at z = z0
   if(zref <= z0)
      disp('Dont know what to do. zref must be > z0')
      % we could do linear interpolation to z= 0
      % that is still bogus, but at least a positive number
      % this option is discontinous...nice log profile to zo, but then
      % jumps up below that and decreases linearly to 0 at z=0.
      ursg = 0. + u(1) * zref/z_r(1);
   else
      for k=2:N
         if zref <= z_r(k)
            ursg = u(k)+(u(k)-u(k-1))/log( z_r(k)/z_r(k-1)) * log(zref/z_r(k));
            break
         end
      end
   end
end
%% option 1
if(1) % option 2 - do the linear profile below zref = z_r(1)
   if(zref <= z_r(1))
      disp('Doing linear interpolation below z_r(1)')
      % we could do linear interpolation to z= 0
      % that is still bogus, but at least a positive number
      % this option is smoother...linear from z=zref to z=0. Maybe more 
      % robust...but option 1 is better when z0 < zref < z_r(1)
      ursg = 0. + u(1) * zref/z_r(1);
   else
      for k=2:N
         disp([zref, z_r(k)]);
         if zref > z_r(k-1) && zref <= z_r(k);
            ursg = u(k)+(u(k)-u(k-1))/log( z_r(k)/z_r(k-1)) * log(zref/z_r(k));
            break
         end
      end
   end
end

figure(1); 

plot(u,z_r,'k','LineWidth',2)
hold on
plot(ursg,zref,'bx')
x1=ursg; y1=zref;
hold on
plot([x1 x1], [0.0 y1],'b--');
hold on
plot([0.0 x1],[y1 y1],'b--');
hold on 
xlabel('u')
ylabel('z')
%%

abs_zoMIN=5.0*(10^-5);
d50=0.0004; % d50 has to be greater than 0.0005 for zoMIN to be depending on it.  

% zref = reference height for current velocity [m]
zr=zref; 
zoMAX=0.9*zref; 
zoMIN=max(abs_zoMIN,2.5*d50/30.0)   ; 
zoN=min(max(2.5*d50/30.0, zoMIN),zoMAX) ;

m_kb=zoN*30 ; 

ubr=0.32; %      ubr = rep. wave-orbital velocity amplitude outside wbl [m/s]
wr=1.06 ; %      wr = rep. angular wave frequency = 2pi/T [rad/s]
ucr=ursg; %      ucr = current velocity at height zr [m/s] %1.43*10^(-2) ;
%zr=0.02 ; % 0.0224;  % 0.16; 
%      phiwc = angle between currents and waves at zr (radians)
phiwc= 4.33;% 0.222; 
%      kN = bottom roughness height (e.q. Nikuradse k) [m]
%kN=1.5000000000000000E-003 ; 

iverbose=1 ;
m = m94( ubr, wr, ucr, zr, phiwc, m_kb, iverbose ) ; 

disp('z not')
zoa = m.zoa 
disp('thck_wbl')
dwc = m.dwc
disp('current shear stress')
ustrc=m.ustrc 





%% Plot it
%x1=2.3026; y1=0.1;
%clf
%figure(1); 
%plot(u,z_r,'k','LineWidth',2)
%hold on


 
