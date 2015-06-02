function lambda = frank_eigenvalues ( n )

%*****************************************************************************80
%
%% FRANK_EIGENVALUES returns the eigenvalues of the FRANK matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Varah,
%    A generalization of the Frank matrix,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 7, Number 3, August 1986, pages 835-839.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real FRANK_EIGENVALUES(N), the eigenvalues.
%
  lambda = sqrt ( 2.0 ) * hermite_roots ( n );
  lambda = ( 0.5 * lambda + sqrt ( 0.25 * lambda .* lambda + 1.0 ) ).^2;

  return
end
