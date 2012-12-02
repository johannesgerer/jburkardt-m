function a = conex2_inverse ( alpha )

%*****************************************************************************80
%
%% CONEX2_INVERSE returns the inverse of the CONEX2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining A.  
%    A common value is 100.0.  ALPHA must not be zero.
%
%    Output, real A(3,3), the matrix.
%
  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONEX2_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input value of ALPHA was zero.\n' );
    error ( 'CONEX2_INVERSE - Fatal error!' );
  end

  a(1,1) = 1.0;
  a(1,2) = ( 1.0 - alpha * alpha ) / alpha;
  a(1,3) = ( 1.0 + alpha * alpha ) / alpha^2;

  a(2,1) = 0.0;
  a(2,2) = alpha;
  a(2,3) = 1.0;

  a(3,1) = 0.0;
  a(3,2) = 0.0;
  a(3,3) = 1.0;

  return
end
