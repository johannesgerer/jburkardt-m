function [ weights, points ] = tsgMakeQuadrature( dim, oned, depth, order, type, anisotropy, alpha_beta, transformAB )
%
% [ weights, points ] = tsgMakeQuadrature( dim, oned, depth, order, type, anisotropy, alpha_beta )
% 
% 
% dim: (all grids) integrer bigger than 0 
%      the input dimensions
%
% oned: (all grids) string for the underlying 1-D rule that induces the grid
%       <clenshaw-curtis,chebychev,gauss-legendre> are global grids and use lagrange polynomials
%                                                  for interpolation
%       <fejer-2> global grid using lagrange polynomials and assumes that
%                 the boundaries are zero
%       <gauss-chebyshev-1,gauss-chebyshev-2> global grid using lagrange polynomials
%                 the points and weights integrate against density functions
%                 1/sqrt(1-x^2) and sqrt(1-x^2)
%       <gauss-gegenbauer> global grid using lagrange polynomials
%                 the points and weights integrate against density function
%                 ( 1-x^2 )^alpha
%       <gauss-jacobi> global grid using lagrange polynomials
%                 the points and weights integrate against density function
%                 ( 1-x )^alpha * ( 1+x )^beta
%       <gauss-laguerre> global grid using lagrange polynomials
%                 the points and weights integrate on (0,inf) against density function
%                 x^alpha * epx( -x )
%                 NOTE: interpolation is unstabe
%       <gauss-hermite> global grid using lagrange polynomials
%                 the points and weights integrate on (-inf,inf) against density function
%                 |x|^alpha * epx( -x^2 )
%                 NOTE: interpolation is unstabe
%       <local-polynomial,local-polynomial-zero> local grids using polynomials
%                 of specified order, the zero rule assumes the boundaries
%                 are zero
%       <local-wavelet> local grids using wavelets of order 1 or 3
%
%
% depth: (all grids) integer bigger than or equal to 0 (0 is accepted only by type = basis)
%        the deinsity of the grid, i.e. levels
%
% order: (local polynomial or wavelet grids only) integer (wavelet grids support only 1 and 3)
%        the order of the grid, i.e. linear, quadratic, cubic ...
%
% type: (global grids only) string from <level,basis,hyperbolic>
%       level used the classical Smolyak tensor selection (depth == level)
%       basis gives the minimum subset of the tensors requires to capture a
%             polynomial of certain degree, 
%             clenshaw-curtis and chebychev consider interolation
%             gauss-legendre uses interation
%
% anisotropy: (global grids only) vector of size dim, the vector 
%             MUST CONTAIN ONLY INTEGERS
%             gives linear weighting on the selection of the tensors
%             the assumption is that the weights are represented as
%             rational numbers that add up to one, hence anisotropy should
%             only contain the numerators
%
% alpha_beta: (global grids with Gauss-Gegenbauer ... ) vector of size 2 by 1
%             gives the distribution parameters for the integration
%             densities
%
% transformAB: (all grids) a matrix of dim rows and 2 columns
%              for all but gauss-laguerre and gauss-hermite grids, the
%              transform specifies the lower and upper bound of the domain
%              in each direction. For gauss-laguerre and gauss-hermite
%              grids, the transform gives the a and b parameters that
%              change the weight to 
%              exp( -b ( x- a ) )  and  exp( -b ( x - a )^2 )
%
% NOTE: anisotropy, alpha_beta and transformAB can be omited or set to [],
%       which forces the use of default values
%
[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames ( '' );

bLocal = ( strcmp( oned, 'local-polynomial') || strcmp( oned, 'local-wavelet' ) || strcmp( oned, 'local-polynomial-zero') );

sCommand = [sTasGrid,' -makequadrature'];

sCommand = [ sCommand, ' -dimensions ',num2str(dim)];

sCommand = [ sCommand, ' -onedim ',oned];

sCommand = [ sCommand, ' -depth ',num2str(depth)];

if ( bLocal )
    sCommand = [ sCommand, ' -order ',num2str(order)];
else
    sCommand = [ sCommand, ' -type ',type];
end

if ( exist('alpha_beta') && (max( size( alpha_beta )) ~= 0) )
    sCommand = [ sCommand, ' -alpha ',num2str(alpha_beta(1))];
    if ( max( size( alpha_beta ) ) > 1 )
        sCommand = [ sCommand, ' -beta ',num2str(alpha_beta(2))];
    end
end

sCommand = [ sCommand, ' -of ',qFile ];

if ( ~bLocal && exist('anisotropy') && max( size( anisotropy )) ~= 0 )
    tsgWriteMatrix( wFile, anisotropy );
    sCommand = [ sCommand, ' -af ',wFile];
end

if ( exist('transformAB') && (max( size( transformAB )) ~= 0) )
    tsgWriteMatrix( vFile, transformAB );
    sCommand = [ sCommand, ' -if ',vFile];
end

fprintf ( 1, 'DEBUG: sCommand = %s\n', sCommand );

[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
else
    [ q ] = tsgReadMatrix( qFile );

    weights = q(:,1);
    points = q(:,2:end);
end

tsgDeleteGridByName('');

end
