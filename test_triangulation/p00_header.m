function p00_header ( test )

%*****************************************************************************80
%
%% P00_HEADER prints the header for a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
  if ( test == 1 )
    p01_header ( );
  elseif ( test == 2 )
    p02_header ( );
  elseif ( test == 3 )
    p03_header ( );
  elseif ( test == 4 )
    p04_header ( );
  elseif ( test == 5 )
    p05_header ( );
  elseif ( test == 6 )
    p06_header ( );
  elseif ( test == 7 )
    p07_header ( );
  elseif ( test == 8 )
    p08_header ( );
  elseif ( test == 9 )
    p09_header ( );
  elseif ( test == 10 )
    p10_header ( );
  elseif ( test == 11 )
    p11_header ( );
  elseif ( test == 12 )
    p12_header ( );
  elseif ( test == 13 )
    p13_header ( );
  elseif ( test == 14 )
    p14_header ( );
  elseif ( test == 15 )
    p15_header ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_HEADER - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_HEADER - Fatal error!' );
  end

  return
end
