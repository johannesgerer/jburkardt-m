function [ fxx, fxy, fyy ] = f00_f2 ( fi, n, x, y )

%*****************************************************************************80
%
%% F00_F2 returns second derivatives of any function.
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
%    Output, real FXX(N,1), FXY(N,1), FYY(N,1), the second derivatives.
%
  if ( fi == 1 )
    [ fxx, fxy, fyy ] = f01_f2 ( n, x, y );
  elseif ( fi == 2 )
    [ fxx, fxy, fyy ] = f02_f2 ( n, x, y );
  elseif ( fi == 3 )
    [ fxx, fxy, fyy ] = f03_f2 ( n, x, y );
  elseif ( fi == 4 )
    [ fxx, fxy, fyy ] = f04_f2 ( n, x, y );
  elseif ( fi == 5 )
    [ fxx, fxy, fyy ] = f05_f2 ( n, x, y );
  elseif ( fi == 6 )
    [ fxx, fxy, fyy ] = f06_f2 ( n, x, y );
  elseif ( fi == 7 )
    [ fxx, fxy, fyy ] = f07_f2 ( n, x, y );
  elseif ( fi == 8 )
    [ fxx, fxy, fyy ] = f08_f2 ( n, x, y );
  elseif ( fi == 9 )
    [ fxx, fxy, fyy ] = f09_f2 ( n, x, y );
  elseif ( fi == 10 )
    [ fxx, fxy, fyy ] = f10_f2 ( n, x, y );
  elseif ( fi == 11 )
    [ fxx, fxy, fyy ] = f11_f2 ( n, x, y );
  elseif ( fi == 12 )
    [ fxx, fxy, fyy ] = f12_f2 ( n, x, y );
  elseif ( fi == 13 )
    [ fxx, fxy, fyy ] = f13_f2 ( n, x, y );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F00_F2 - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index FI = %d\n', fi );
    error ( 'F00_F2 - Fatal error!' );
  end

  return
end
