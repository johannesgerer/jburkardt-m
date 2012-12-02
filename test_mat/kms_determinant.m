function determ = kms_determinant ( alpha, n )

%*****************************************************************************80
%
%% KMS_DETERMINANT returns the determaint of the KMS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
% 
  if ( n == 1 )
    determ = 1.0
  else
    determ = ( 1.0 - alpha * alpha )^( n - 1 );
  end

  return
end
