function title = p00_title ( test )

%*****************************************************************************80
%
%% P00_TITLE returns a title for a problem.
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
%    Output, string TITLE, a title for the problem.
%
  if ( test == 1 )
    title = p01_title ( );
  elseif ( test == 2 )
    title = p02_title ( );
  elseif ( test == 3 )
    title = p03_title ( );
  elseif ( test == 4 )
    title = p04_title ( );
  elseif ( test == 5 )
    title = p05_title ( );
  elseif ( test == 6 )
    title = p06_title ( );
  elseif ( test == 7 )
    title = p07_title ( );
  elseif ( test == 8 )
    title = p08_title ( );
  elseif ( test == 9 )
    title = p09_title ( );
  elseif ( test == 10 )
    title = p10_title ( );
  elseif ( test == 11 )
    title = p11_title ( );
  elseif ( test == 12 )
    title = p12_title ( );
  elseif ( test == 13 )
    title = p13_title ( );
  elseif ( test == 14 )
    title = p14_title ( );
  elseif ( test == 15 )
    title = p15_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
