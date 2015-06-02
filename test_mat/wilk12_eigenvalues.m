function lambda = wilk12_eigenvalues ( )

%*****************************************************************************80
%
%% WILK12_EIGENVALUES returns the eigenvalues of the WILK12 matrix.
%
%  Formula:
%
%    32.2288915
%    20.1989886
%    12.3110774
%     6.96153309
%     3.51185595
%     1.55398871
%     0.643505319
%     0.284749721
%     0.143646520
%     0.081227659240405
%     0.049507429185278
%     0.031028060644010
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real LAMBDA(12,1), the eigenvalues.
%
  lambda(1:12,1) = [ ...
    32.2288915; ...
    20.1989886; ...
    12.3110774; ...
     6.96153309; ...
     3.51185595; ...
     1.55398871; ...
     0.643505319; ...
     0.284749721; ...
     0.143646520; ...
     0.081227659240405; ... 
     0.049507429185278; ...
     0.031028060644010 ];

  return
end
