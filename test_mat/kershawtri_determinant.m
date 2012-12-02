function determ = kershawtri_determinant ( n, x )

%*****************************************************************************80
%
%% KERSHAWTRI_DETERMINANT returns the determinant of the KERSHAWTRI matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X((N+1)/2), defines the diagonal of the matrix.
%
%    Output, real DETERM, the determinant.
%
  nh = floor ( n / 2 );

  r(1:n+1) = 0.0;

  r(1) = 1.0;
  r(2) = - x(1);
  for i = 3 : n
    if ( i - 1 <= nh )
      xim1 = x(i-1);
    else
      xim1 = x(n+1-i+1);
    end
    r(i) = - ( xim1 * r(i-1) + r(i-2) );
  end

  determ = x(1) * r(n) + r(n-1);

  return
end
