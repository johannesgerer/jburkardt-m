function cordic_test ( )

%*****************************************************************************80
%
%% CORDIC_TEST tests CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORDIC_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CORDIC library.\n' );

  cordic_test001 ( );
  cordic_test002 ( );
  cordic_test003 ( );
  cordic_test004 ( );
  cordic_test005 ( );
  cordic_test006 ( );
  cordic_test007 ( );
  cordic_test008 ( );
  cordic_test009 ( );
  cordic_test010 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORDIC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
