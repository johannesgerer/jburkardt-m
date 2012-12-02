function fd1d_predator_prey_plot ( )

%*****************************************************************************80
%
%% FD1D_PREDATOR_PREY_PLOT
%
% Program to plot the 1D travelling waves corresponding to outputted data
% from react_diffP1_pbc.f. Currently much is commented out so that only the
% solutions for u are plotted. Important note: the paths for loading the data 
% may need to be amended accordingly.
% 28 Apr 2003

format

% Load data that was output from react_diffP1_pbc.f

load u1d.txt -ascii
% load v1d.txt -ascii
load data.txt -ascii

[rows,cols]=size(u1d);
NO_PROF=rows;       % recall every Sth profile kept
NO_NODE=cols;       % approx 1000 nodes per profile

TMAX=data(1);    % max time value
TMIN=data(2);    % min time value
LMAX=data(3);       % max x value
LMIN=data(4);
DELT=data(5);    % del t
DELX=data(6);    % del x
DIMJ=round(data(7));  % BIGJ+1
DIMN=round(data(8)); % BIGN+1
S = round(data(9));  % plot every 'sth' profile
R = round(data(10));   % use every 'rth' node per profile
RC = data(11);    % amplitude of PPW
LAM0 = data(12);
LAM1 = data(13);
OM0 = data(14);
OM1 = data(15);
CHOICE = round(data(16));   % 1 for Gaussian initial data
                               % and 0 for PPW initial data
SMALLN= round(TMIN/DELT);
SMALLJ=round(LMIN/DELX);

if CHOICE==0
  ans=input('Do you wish to plot the exact PPW too (y or n)?   ','s');
else
  ans = 'n';
end
    
% Set up subplots

% subplot(2,1,1)
hold on
axis([LMIN LMAX (TMIN-2) (TMAX+2)])
%axis square
% title('Periodic plane waves  ')
% xlabel('x  ')
% ylabel('u(x,t) + t ')
% subplot(2,1,2)
% hold on
% axis([LMIN LMAX (TMIN-2*RC) TMAX])
% axis square
% title('Periodic plane waves  ')
% xlabel('x  ')
% ylabel('v(x,t) + t ')

j_index=1:NO_NODE;
x_values=(SMALLJ+(j_index-1)*R)*DELX;

if ans=='y'

	for prof = 1:NO_PROF
        
		time = (SMALLN+(prof-1)*S)*DELT;
               
		U = RC*cos((OM0+OM1*(RC^2))*time + sqrt(LAM0-LAM1*(RC^2))*x_values);
		V = RC*sin((OM0+OM1*(RC^2))*time + sqrt(LAM0-LAM1*(RC^2))*x_values);
        
          % notice the special matlab feature here: 'time' is a scaler, while
          % 'x_values' is a vector, so in the argument for cos and sin matlab
          % automatically adds a scaler to each component of a vector.
            
        % subplot(2,1,1)
		plot(x_values,u1d(prof,:)+time,'k--');
          % profile plotted for u1d
		plot(x_values,U+time,'k');
          % profile plotted for exact PPW solution U
                
		% subplot(2,1,2)
		% plot(x_values,v1d(prof,:)+time,'k');
		  % profile plotted for v1d
		% plot(x_values,V+time,'-.');
          % profile plotted for exact PPW solution V
          
	end
  
elseif ans=='n'
        
	for prof = 1:NO_PROF
        
		time = (SMALLN+(prof-1)*S)*DELT;
              
		% subplot(2,1,1)
		plot(x_values,u1d(prof,:)+time,'r');
          % profile plotted for U
		% subplot(2,1,2)
		% plot(x_values,v1d(prof,:)+time);
		  % profile plotted for V
          
	end  

else

    error('Input must be y or n ')
    
end

  return
end
