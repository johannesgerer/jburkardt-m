function value = p00_param_default ( test )

%*****************************************************************************80
%
%% P00_PARAM_DEFAULT defaults the parameters of any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, integer VALUE, the number of problem parameters.
%
  if ( test == 1 )
    value = 0;
  elseif ( test == 2 )
    value = 0;
  elseif ( test == 3 )
    value = 0;
  elseif ( test == 4 )
    value = 0;
  elseif ( test == 5 )
    value = 0;
  elseif ( test == 6 )
    value = 0;
  elseif ( test == 7 )
    value = 0;
  elseif ( test == 8 )
    value = 0;
  elseif ( test == 9 )
    value = 0;
  elseif ( test == 10 )
    value = 0;
  elseif ( test == 11 )
    value = 0;
  elseif ( test == 12 )
    value = 0;
  elseif ( test == 13 )
    value = 0;
  elseif ( test == 14 )
    value = 0;
  elseif ( test == 15 )
    value = p15_param ( 'DEFAULT' );
  elseif ( test == 16 )
    value = p16_param ( 'DEFAULT' );
  elseif ( test == 17 )
    value = p17_param ( 'DEFAULT' );
  elseif ( test == 18 )
    value = p18_param ( 'DEFAULT' );
  elseif ( test == 19 )
    value = p19_param ( 'DEFAULT' );
  elseif ( test == 20 )
    value = p20_param ( 'DEFAULT' );
  elseif ( test == 21 )
    value = 0;
  elseif ( test == 22 )
    value = 0;
  elseif ( test == 23 )
    value = 0;
  elseif ( test == 24 )
    value = 0;
  elseif ( test == 25 )
    value = 0;
  elseif ( test == 26 )
    value = p26_param ( 'DEFAULT' );
  elseif ( test == 27 )
    value = 0;
  elseif ( test == 28 )
    value = 0;
  elseif ( test == 29 )
    value = 0;
  elseif ( test == 30 )
    value = 0;
  elseif ( test == 31 )
    value = p31_param ( 'DEFAULT' );
  elseif ( test == 32 )
    value = p32_param ( 'DEFAULT' );
  elseif ( test == 33 )
    value = p33_param ( 'DEFAULT' );
  elseif ( test == 34 )
    value = p34_param ( 'DEFAULT' );
  elseif ( test == 35 )
    value = p35_param ( 'DEFAULT' );
  elseif ( test == 36 )
    value = 0;
  elseif ( test == 37 )
    value = p37_param ( 'DEFAULT' );
  elseif ( test == 38 )
    value = p38_param ( 'DEFAULT' );
  elseif ( test == 39 )
    value = p39_param ( 'DEFAULT' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_PARAM_DEFAULT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_PARAM_DEFAULT - Fatal error!' );
  end

  return
end
