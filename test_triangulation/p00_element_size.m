function element_size = p00_element_size ( test )

%*****************************************************************************80
%
%% P00_ELEMENT_SIZE returns a typical element size for a problem.
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
%    Input, ELEMENT_SIZE, a typical element size.
%
  if ( test == 1 )
    element_size = p01_element_size ( );
  elseif ( test == 2 )
    element_size = p02_element_size ( );
  elseif ( test == 3 )
    element_size = p03_element_size ( );
  elseif ( test == 4 )
    element_size = p04_element_size ( );
  elseif ( test == 5 )
    element_size = p05_element_size ( );
  elseif ( test == 6 )
    element_size = p06_element_size ( );
  elseif ( test == 7 )
    element_size = p07_element_size ( );
  elseif ( test == 8 )
    element_size = p08_element_size ( );
  elseif ( test == 9 )
    element_size = p09_element_size ( );
  elseif ( test == 10 )
    element_size = p10_element_size ( );
  elseif ( test == 11 )
    element_size = p11_element_size ( );
  elseif ( test == 12 )
    element_size = p12_element_size ( );
  elseif ( test == 13 )
    element_size = p13_element_size ( );
  elseif ( test == 14 )
    element_size = p14_element_size ( );
  elseif ( test == 15 )
    element_size = p15_element_size ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_ELEMENT_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_ELEMENT_SIZE - Fatal error!' );
  end

  return
end
