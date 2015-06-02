function tsgExample ( )
%
% tsgExample()
%
% this is exmaple source code on how to call the different functions
% this does the exact same thing as the C++ example
%

% EXAMPLE 1: 
%
% integrate: f(x,y) = exp( -x^2 ) * cos( y )
% using classical Smplyak grid with Clenshaw-Curtis points and weights
%

dim = 2;
level = 7;
order = 0; % not used by the code
[ weights, points ] = tsgMakeQuadrature( dim, 'clenshaw-curtis', level, order, 'level' );

I = weights' * ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
E = abs( I - quad( @(x)( exp( -x.^2 ) ), -1, 1, 1.E-14 )*quad( @(x)( cos(x) ), -1, 1, 1.E-14 ) );

disp([' Example 1: ']);
disp(['grid has ',num2str(size(points,1)),' points']);
disp(['integral: ',num2str(I)]);
disp(['error: ',num2str(E)]);
disp([' ']);



% EXAMPLE 2:
%
% interpolate: f(x,y) = exp( -x^2 ) * cos( y )
% with a rule that exactly interpolates polynomials up to order 10
%
% NOTE: any grid with name 'tsgExample2' will be overwritten by the
% tsgMakeGrid() command

dim = 2;
outs = 1;
prec = 10;
order = 0; % not used by the code
[ lGrid, points ] = tsgMakeGrid( 'tsgExample2', dim, outs, 'clenshaw-curtis', prec, order, 'basis' );

vals = ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
tsgLoadValues( lGrid, vals );

[ res ] = tsgEvaluate( lGrid, [ 0.3, 0.7 ] );
[ I ] = tsgIntegrate( lGrid );

E = quad( @(x)( exp( -x.^2 ) ), -1, 1, 1.E-14 )*quad( @(x)( cos(x) ), -1, 1, 1.E-14 ); % exact integral

disp([' Example 2: ']);
disp(['grid has ',num2str(size(points,1)),' points']);
disp(['interpolant at (0.3,0.7): ',num2str(res)]);
disp(['error: ',num2str(res - exp( -0.3^2 ) * cos( 0.7 ) )]);
disp(['integral: ',num2str(I)]);
disp(['error: ',num2str(abs(I - E))]);
disp([' ']);
tsgDeleteGrid( lGrid ); % clear all temporary used files



% EXAMPLE 3: 
%
% integrate: f(x,y) = exp( -x^2 ) * cos( y )
% using classical Smplyak grid with Clenshaw-Curtis points and weights
%

dim = 2;
prec = 10;
order = 0; % not used by the code
[ weights, points ] = tsgMakeQuadrature( dim, 'gauss-legendre', prec, order, 'basis' );

I = weights' * ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
E = abs( I - quad( @(x)( exp( -x.^2 ) ), -1, 1, 1.E-14 )*quad( @(x)( cos(x) ), -1, 1, 1.E-14 ) );

disp([' Example 3: ']);
disp(['grid has ',num2str(size(points,1)),' points']);
disp(['integral: ',num2str(I)]);
disp(['error: ',num2str(E)]);
disp([' ']);




% EXAMPLE 4: 
%
% integrate: f(x,y) = ( x - 2 )^3 * exp( -y^2 ) * ( 1 - x^2 )^0.4 * ( 1 - y^2 )^0.4
% using Gauss-Gegenbauer rule with 8 times as many points in y direction as
% in the x direction
%

dim = 2;
prec = 16;
order = 0; % not used by the code
[ weights, points ] = tsgMakeQuadrature( dim, 'gauss-gegenbauer', prec, order, 'level', [ 8, 1 ]', [ 0.4, 0.0 ] );

I = weights' * ( ( points(:,1) - 2 ).^3 .* exp( -points(:,2).^2 ) );
E = abs( I - quad( @(x)( (x - 2).^3 .* (1 - x.^2).^0.4 ), -1, 1, 1.E-14 ) * quad( @(x)( exp( -x.^2 ) .* ( 1 - x.^2 ).^0.4 ), -1, 1, 1.E-14 ) );

disp([' Example 4: ']);
disp(['grid has ',num2str(size(points,1)),' points']);
disp(['integral: ',num2str(I)]);
disp(['error: ',num2str(E)]);
disp([' ']);



% EXAMPLE 5: 
%
% interpolate: f(x,y) = exp( -x^2 ) * cos( y )
% using using adaptive hierarhical locally quadratic polynomial basis
%

dim = 2;
outs = 1;
initial_level = 4;
order = 2;
[ lGrid, newp ] = tsgMakeGrid( 'tsgExample5', dim, outs, 'local-polynomial', initial_level, order, 'level' );
% NOTE: even though 'level' gets ignored, it is still needed for the
% funciton call

disp([' Example 5: ']);
itr = 0;

while ( size( newp, 1 ) > 0 )
    
    norm_points = 0.5*newp + 0.5; % normalize to the domain [0,1] x [0,1]
    
    vals = exp( -norm_points(:,1).^2 ) .* cos( norm_points(:,2) );
    tsgLoadValues( lGrid, vals );
    [ res ] = tsgEvaluate( lGrid, 2*[ 0.3, 0.7 ] - [ 1, 1 ] );
    
    [ points ] = tsgGetPoints( lGrid );

    disp(['Iteration: ',num2str(itr),' number of samples: ',num2str(size(points,1)),' value: ',num2str(res),' error: ',num2str(abs(res-exp(-0.3^2)*cos(0.7)))]);

    [ newp ] = tsgRefineGrid( lGrid, 0.000001, 'classic' );
    itr = itr + 1;
    
end
tsgDeleteGrid( lGrid );
disp([' ']);

end

