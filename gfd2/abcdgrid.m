%% ABCDGRID tests ABCGRIDERR.
%
%  Discussion:
%
%    This script tests ABCGRIDERR.
%
%    This script is discussed in chapter 9 of the reference.
%
%  Modified:
%
%    01 December 2009
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
clear all;

Rodx=10;
Rody=10;

for i=1:100
    for j=1:100
        erra(i,j)=abcdgriderr('A',(i-1)/99*pi/4,(j-1)/99*pi/4,Rodx,Rody);
        errb(i,j)=abcdgriderr('B',(i-1)/99*pi/4,(j-1)/99*pi/4,Rodx,Rody);
        errc(i,j)=abcdgriderr('C',(i-1)/99*pi/4,(j-1)/99*pi/4,Rodx,Rody);
        errd(i,j)=abcdgriderr('D',(i-1)/99*pi/4,(j-1)/99*pi/4,Rodx,Rody);
    end
end

surf(erra')
shading interp
caxis([0 1])
colorbar
axis([0 100 0 100 0 1])
title('A-grid','FontSize',20)
print -depsc agrid.eps
pause

surf(errb')
shading interp
caxis([0 1])
colorbar
axis([0 100 0 100 0 1])
title('B-grid','FontSize',20)
print -depsc bgrid.eps
pause

surf(errc')
shading interp
caxis([0 1])
colorbar
axis([0 100 0 100 0 1])
title('C-grid','FontSize',20)
print -depsc cgrid.eps
pause

surf(errd')
shading interp
caxis([0 1])
colorbar
axis([0 100 0 100 0 1])
title('D-grid','FontSize',20)
print -depsc dgrid.eps
