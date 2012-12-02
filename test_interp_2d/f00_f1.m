function [ fx, fy ] = f00_f1 ( fi, n, x, y )

%*****************************************************************************80
%
%% F00_F1 returns first derivatives of any function.
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
%    Output, real FX(N,1), FY(N,1), the first derivative values.
%
  if ( fi == 1 )
    [ fx, fy ] = f01_f1 ( n, x, y );
  elseif ( fi == 2 )
    [ fx, fy ] = f02_f1 ( n, x, y );
  elseif ( fi == 3 )
    [ fx, fy ] = f03_f1 ( n, x, y );
  elseif ( fi == 4 )
    [ fx, fy ] = f04_f1 ( n, x, y );
  elseif ( fi == 5 )
    [ fx, fy ] = f05_f1 ( n, x, y );
  elseif ( fi == 6 )
    [ fx, fy ] = f06_f1 ( n, x, y );
  elseif ( fi == 7 )
    [ fx, fy ] = f07_f1 ( n, x, y );
  elseif ( fi == 8 )
    [ fx, fy ] = f08_f1 ( n, x, y );
  elseif ( fi == 9 )
    [ fx, fy ] = f09_f1 ( n, x, y );
  elseif ( fi == 10 )
    [ fx, fy ] = f10_f1 ( n, x, y );
  elseif ( fi == 11 )
    [ fx, fy ] = f11_f1 ( n, x, y );
  elseif ( fi == 12 )
    [ fx, fy ] = f12_f1 ( n, x, y );
  elseif ( fi == 13 )
    [ fx, fy ] = f13_f1 ( n, x, y );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F00_F1 - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index FI = %d\n', fi );
    error ( 'F00_F1 - Fatal error!' );
  end

  return
end
