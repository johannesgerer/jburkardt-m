function value = p32_param ( action, name, value )

%*****************************************************************************80
%
%% P32_PARAM defaults, sets, or gets the parameters for problem 32.
%
%  Discussion:
%
%    In typical use, the user calls
%      p32_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p32_param ( 'GET', 'BETA' )
%    or set to a new value, as in:
%      p32_param ( 'SET', 'BETA', 2.0 )
%
%    BETA, RHO, SIGMA are the parameters
%
%    For "interesting" behavior, RHO should be greater than 1.
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
%    Input, string ACTION:
%    'DEFAULT' sets the variables to default values.  
%    'SET' sets the variable chosen by NAME to have the value VALUE.
%    'GET' gets the variable chosen by NAME.
%
%    Input, string NAME, the name of the variable, which should
%    be 'BETA', 'RHO', or 'SIGMA'.  NAME is ignored if the ACTION is 'DEFAULT'.
%
%    Input, real VALUE, the value to be assigned the variable NAME,
%    if the value of ACTION was 'SET'.  Otherwise VALUE is ignored.
%
%    Output, real VALUE, depends on the input value of ACTION:
%    'DEFAULT', returns the number of variables;
%    'SET', returns the input value of VALUE;
%    'GET', returns the value of the variable NAME.
%
  persistent beta;
  persistent rho;
  persistent sigma;

  if ( s_eqi ( action, 'DEFAULT' ) )

    beta = 8.0 / 3.0;
    rho = 28.0;
    sigma = 10.0;

    value = 3;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'BETA' ) )
      beta = value;
    elseif ( s_eqi ( name, 'RHO' ) )
      rho = value;
    elseif ( s_eqi ( name, 'SIGMA' ) )
      sigma = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P32_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P32_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'BETA' ) )
      value = beta;
    elseif ( s_eqi ( name, 'RHO' ) )
      value = rho;
    elseif ( s_eqi ( name, 'SIGMA' ) )
      value = sigma;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P32_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P32_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P32_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P32_PARAM - Fatal error!' );

  end

  return
end
