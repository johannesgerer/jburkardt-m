function stroud_test29 ( )

%*****************************************************************************80
%
%% TEST29 tests SIMPLEX_UNIT_**_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_ND_INDEX;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST29\n' );
  fprintf ( 1, '  For integrals in the unit simplex in ND,\n' );
  fprintf ( 1, '  SIMPLEX_UNIT_01_ND uses a formula of degree 1.\n' );
  fprintf ( 1, '  SIMPLEX_UNIT_03_ND uses a formula of degree 3.\n' );
  fprintf ( 1, '  SIMPLEX_UNIT_05_ND uses a formula of degree 5.\n' );
  fprintf ( 1, '  SIMPLEX_UNIT_05_2_ND uses a formula of degree 5.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check the integral of 1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  N     Volume         #1              #3              #5              #5.2\n' );
  fprintf ( 1, '\n' );

  FUNC_ND_INDEX = 1;

  for n = 2 : 16

    result1 = simplex_unit_01_nd ( 'function_nd', n );
    result2 = simplex_unit_03_nd ( 'function_nd', n );
    result3 = simplex_unit_05_nd ( 'function_nd', n );
    result4 = simplex_unit_05_2_nd ( 'function_nd', n );

    volume = simplex_unit_volume_nd ( n );

    fprintf ( 1, '  %2d  %13e  %13e  %13e  %13e  %13e\n', ...
      n, volume, result1, result2, result3, result4 );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check the integral of X:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N     #1              #3              #5              #5.2\n' );
  fprintf ( 1, '\n' );

  FUNC_ND_INDEX = 2;

  for n = 2 : 16

    result1 = simplex_unit_01_nd ( 'function_nd', n );
    result2 = simplex_unit_03_nd ( 'function_nd', n );
    result3 = simplex_unit_05_nd ( 'function_nd', n );
    result4 = simplex_unit_05_2_nd ( 'function_nd', n );

    fprintf ( 1, '  %2d  %13e  %13e  %13e  %13e\n', ...
      n, result1, result2, result3, result4 );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check the integral of X**2:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N     #1              #3              #5              #5.2\n' );
  fprintf ( 1, '\n' );

  FUNC_ND_INDEX = 3;

  for n = 2 : 16

    result1 = simplex_unit_01_nd ( 'function_nd', n );
    result2 = simplex_unit_03_nd ( 'function_nd', n );
    result3 = simplex_unit_05_nd ( 'function_nd', n );
    result4 = simplex_unit_05_2_nd ( 'function_nd', n );

    fprintf ( 1, '  %2d  %13e  %13e  %13e  %13e\n', ...
      n, result1, result2, result3, result4 );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check the integral of X**3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N     #1              #3              #5              #5.2\n' );
  fprintf ( 1, '\n' );

  FUNC_ND_INDEX = 4;

  for n = 2 : 16

    result1 = simplex_unit_01_nd ( 'function_nd', n );
    result2 = simplex_unit_03_nd ( 'function_nd', n );
    result3 = simplex_unit_05_nd ( 'function_nd', n );
    result4 = simplex_unit_05_2_nd ( 'function_nd', n );

    fprintf ( 1, '  %2d  %13e  %13e  %13e  %13e\n', ...
      n, result1, result2, result3, result4 );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Check the integral of X**5:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N     #1              #3              #5              #5.2\n' );
  fprintf ( 1, '\n' );

  FUNC_ND_INDEX = 6;

  for n = 2 : 16

    result1 = simplex_unit_01_nd ( 'function_nd', n );
    result2 = simplex_unit_03_nd ( 'function_nd', n );
    result3 = simplex_unit_05_nd ( 'function_nd', n );
    result4 = simplex_unit_05_2_nd ( 'function_nd', n );

    fprintf ( 1, '  %2d  %13e  %13e  %13e  %13e\n', ...
      n, result1, result2, result3, result4 );

  end

  return
end
