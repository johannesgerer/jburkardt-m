function uniform_test ( )

%*****************************************************************************80
%
%% UNIFORM_TEST tests UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the UNIFORM library.\n' );

  uniform_test01 ( );
  uniform_test02 ( );
  uniform_test03 ( );
  uniform_test04 ( );
  uniform_test05 ( );
  uniform_test06 ( );
  uniform_test065 ( );
  uniform_test07 ( );
  uniform_test08 ( );
  uniform_test09 ( );

  uniform_test10 ();
  if ( 0 )
    uniform_test11 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Skipping UNIFORM_TEST11.\n' );
  end
  uniform_test111 ( );
  uniform_test112 ( );
  uniform_test118 ( );
  uniform_test119 ( );
  uniform_test12 ( );
  uniform_test13 ( );
  uniform_test14 ( );
  uniform_test15 ( );
  uniform_test16 ( );
  uniform_test17 ( );
  uniform_test18 ( );
  uniform_test19 ( );

  uniform_test20 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
