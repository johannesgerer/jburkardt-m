function f = f00_f0 ( fi, n, x, y )

%*****************************************************************************80
%
%% F00_F0 returns the value of any function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FI, the index of the function.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real F(N,1), the function values.
%
  if ( fi == 1 )
    f = f01_f0 ( n, x, y );
  elseif ( fi == 2 )
    f = f02_f0 ( n, x, y );
  elseif ( fi == 3 )
    f = f03_f0 ( n, x, y );
  elseif ( fi == 4 )
    f = f04_f0 ( n, x, y );
  elseif ( fi == 5 )
    f = f05_f0 ( n, x, y );
  elseif ( fi == 6 )
    f = f06_f0 ( n, x, y );
  elseif ( fi == 7 )
    f = f07_f0 ( n, x, y );
  elseif ( fi == 8 )
    f = f08_f0 ( n, x, y );
  elseif ( fi == 9 )
    f = f09_f0 ( n, x, y );
  elseif ( fi == 10 )
    f = f10_f0 ( n, x, y );
  elseif ( fi == 11 )
    f = f11_f0 ( n, x, y );
  elseif ( fi == 12 )
    f = f12_f0 ( n, x, y );
  elseif ( fi == 13 )
    f = f13_f0 ( n, x, y );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F00_F0 - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index FI = %d\n', fi );
    error ( 'F00_F0 - Fatal error!' );
  end

  return
end
