function tsgPlotPoints2D( points, fig )
%
% plotGrid2D( points, fig )
%
% plots the points in points
% fig is the figure to use
% only works in 2-D

if ( nargin < 2 )
    fig = 1;
end

if ( size( points, 2 ) ~= 2 )
    disp(['ERROR: size of q should be n by 2']);
	return
end

qm = min( points );
qM = max( points );

qD = (qM - qm);

qI = 0.05 * qD;

qm = qm - qI;
qM = qM + qI;

%[qm(1),qM(1),qm(2),qM(2)]

figure( fig )
hold on
for i = 1:size(points,1)
	plot( points(i,1), points(i,2), '*' );
end
axis([qm(1),qM(1),qm(2),qM(2)]);


end