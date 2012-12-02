function name = genz_name ( indx )

%*****************************************************************************80
%
%% GENZ_NAME returns the name of a Genz test integrand.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INDX, the index of the test integrand.
%
%    Output, string NAME, the name of the test integrand.
%
  if ( indx == 1 )
    name = 'Oscillatory  ';
  elseif ( indx == 2 )
    name = 'Product Peak ';
  elseif ( indx == 3 )
    name = 'Corner Peak  ';
  elseif ( indx == 4 )
    name = 'Gaussian     ';
  elseif ( indx == 5 )
    name = 'C0 Function  ';
  elseif ( indx == 6 )
    name = 'Discontinuous';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  GENZ_NAME - Fatal error!\n' );
    fprintf ( 1, '  1 <= INDX <= 6 is required.\n' );
    error ( '  GENZ_NAME - Fatal error!' );
  end

  return
end
