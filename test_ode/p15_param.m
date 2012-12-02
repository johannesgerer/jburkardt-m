function value = p15_param ( action, name, value )

%*****************************************************************************80
%
%% P15_PARAM defaults, sets, or gets the parameters for problem 15.
%
%  Discussion:
%
%    In typical use, the user calls
%      p15_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p15_param ( 'GET', 'K2' )
%    or set to a new value, as in:
%      p15_param ( 'SET', 'K2', 17.3 )
%
%    K2 is the gravitational constant;
%    M0 is the lumped mass of the sun and four inner planets;
%    M1 is the mass of Jupiter;
%    M2 is the mass of Saturn;
%    M3 is the mass of Uranus;
%    M4 is the mass of Neptune;
%    M5 is the mass of Pluto.
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
%    be 'K2', 'M0', 'M1', 'M2', 'M3', 'M4' or 'M5'.  NAME is ignored
%    if the ACTION is 'DEFAULT'.
%
%    Input, real VALUE, the value to be assigned the variable NAME,
%    if the value of ACTION was 'SET'.  Otherwise VALUE is ignored.
%
%    Output, real VALUE, depends on the input value of ACTION:
%    'DEFAULT', returns the number of variables;
%    'SET', returns the input value of VALUE;
%    'GET', returns the value of the variable NAME.
%
  persistent k2;
  persistent m0;
  persistent m1;
  persistent m2;
  persistent m3;
  persistent m4;
  persistent m5;

  if ( s_eqi ( action, 'DEFAULT' ) )

    k2 = 2.95912208286;
    m0 = 1.00000597682;
    m1 = 0.954786104043E-03;
    m2 = 0.285583733151E-03;
    m3 = 0.437273164546E-04;
    m4 = 0.517759138449E-04;
    m5 = 0.277777777778E-05;

    value = 7;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'K2' ) )
      k2 = value;
    elseif ( s_eqi ( name, 'M0' ) )
      m0 = value;
    elseif ( s_eqi ( name, 'M1' ) )
      m1 = value;
    elseif ( s_eqi ( name, 'M2' ) )
      m2 = value;
    elseif ( s_eqi ( name, 'M3' ) )
      m3 = value;
    elseif ( s_eqi ( name, 'M4' ) )
      m4 = value;
    elseif ( s_eqi ( name, 'M5' ) )
      m5 = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P15_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P15_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'K2' ) )
      value = k2;
    elseif ( s_eqi ( name, 'M0' ) )
      value = m0;
    elseif ( s_eqi ( name, 'M1' ) )
      value = m1;
    elseif ( s_eqi ( name, 'M2' ) )
      value = m2;
    elseif ( s_eqi ( name, 'M3' ) )
      value = m3;
    elseif ( s_eqi ( name, 'M4' ) )
      value = m4;
    elseif ( s_eqi ( name, 'M5' ) )
      value = m5;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P15_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P15_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P15_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P15_PARAM - Fatal error!' );

  end

  return
end
