%% DIVASHOW ?
%
%  Discussion:
%
%    This script is discussed in chapter 22 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
this_directory = pwd;

% Name of the output file?

Name = 'output'

% OUTPUTS
% -------
% - fileout is the name of the analysis field plot
% - format_out --> format of the plot:
% format_out = 1 --> jpeg format
% format_out = 2 --> eps format

format_out = 2;

% name of the analysis output files 
fileout1 = [Name,'_analysis'];
fileout2 = [Name,'_error'];


% ---------------------------------------------------------------
% ---------------------------------------------------------------

%cd ./diva/
%
%  DLMREAD is a builtin MATLAB function which reads an ASCII delimited file.
%
data = dlmread('data.dat');
cont = dlmread('coast.cont');

% if reading of .anl files does not work, try to read netcdf file result.nc

[flag,c4,imax,jmax,kmax,valex,nbmots] = uread('fieldgher.anl');
[flag,c4err,imax,jmax,kmax,valexe,nbmots] = uread('errorfieldgher.anl');

gridinfo = textread('gridInfo.dat');

display('contour plotting ...')

ncont=cont(1,1);

ioff=2;
for i=1:ncont
    np=cont(ioff,1);
    xx=cont(ioff+1:ioff+np,1);
    yy=cont(ioff+1:ioff+np,2);

    % to close the contours
    xx = [xx;xx(1)];
    yy = [yy;yy(1)];

    ioff=ioff+np+1;
    hold on
    plot(xx,yy,'k','LineWidth',2)
    fill(xx,yy,[0.7,0.7,.7])
    clear np xx yy
end
hold on;


% analysis plotting
% -----------------

display('analysed field plotting ...')

gg=reshape(c4,imax,jmax);
for i=1:imax
    for j=1:jmax
        if gg(i,j)==valex 
            gg(i,j)=NaN;
        end
    end
end

% grid parameters

xorigin = gridinfo(1)
yorigin = gridinfo(2)
dx = gridinfo(3)
dy = gridinfo(4)
xend = xorigin+(gridinfo(5)-1)*dx
yend = yorigin+(gridinfo(6)-1)*dy

x = [xorigin:dx:xend];
y = [yorigin:dy:yend];


pcolor(x,y,gg')
shading('interp')
xlabel('Longitude ( ^{\circ} E)','fontsize',14)
ylabel('Latitude ( ^{\circ} N)','fontsize',14)
title('Analysis','fontsize',14)
axis([xorigin xend 30 46])
caxis([36 39])
colorbar('horiz')
colormap(jet)

% Now add data points..
%display('data plotting...')

scatter(data(:,1),data(:,2),2,([1 1 1]),'filled')

if (format_out == 1),
    print('-djpeg',[fileout1,'.jpg'])
else 
    print('-depsc2',[fileout1,'.eps'])
end;
display('your plots are finished')
cd(this_directory);
figure
display('contour plotting ...')

ncont=cont(1,1);

ioff=2;
for i=1:ncont
    np=cont(ioff,1);
    xx=cont(ioff+1:ioff+np,1);
    yy=cont(ioff+1:ioff+np,2);

    % to close the contours
    xx = [xx;xx(1)];
    yy = [yy;yy(1)];

    ioff=ioff+np+1;
    hold on
    plot(xx,yy,'k','LineWidth',2)
    fill(xx,yy,[0.7,0.7,.7])
    clear np xx yy
end
hold on;


% analysis plotting
% -----------------

display('analysed field plotting ...')

gg=reshape(c4err,imax,jmax);
for i=1:imax
    for j=1:jmax
        if gg(i,j)==valexe 
            gg(i,j)=NaN;
        end
    end
end

% grid parameters

xorigin = gridinfo(1)
yorigin = gridinfo(2)
dx = gridinfo(3)
dy = gridinfo(4)
xend = xorigin+(gridinfo(5)-1)*dx
yend = yorigin+(gridinfo(6)-1)*dy

x = [xorigin:dx:xend];
y = [yorigin:dy:yend];


pcolor(x,y,gg')
shading('interp')
xlabel('Longitude ( ^{\circ} E)','fontsize',14)
ylabel('Latitude ( ^{\circ} N)','fontsize',14)
title('Error','fontsize',14)
axis([xorigin xend 30 46])
caxis([0 0.7])
colorbar('horiz')
colormap(jet)

% Now add data points..
%display('data plotting...')

scatter(data(:,1),data(:,2),2,([1 1 1]),'filled')

if (format_out == 1),
    print('-djpeg',[fileout1,'.jpg'])
else 
    print('-depsc2',[fileout1,'.eps'])
end;
display('your plots are finished')
cd(this_directory);
