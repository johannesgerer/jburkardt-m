function line_fekete_rule_test ( )

%*****************************************************************************80
%
%% LINE_FEKETE_RULE_TEST tests the LINE_FEKETE_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FEKETE_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LINE_FEKETE_RULE library.\n' );

  for m = [ 5, 11, 21 ]
    line_fekete_rule_test01 ( m );
  end

  for m = [ 5, 11, 21 ]
    line_fekete_rule_test02 ( m );
  end

  m = 21;
  line_fekete_rule_bos_levenberg_test ( m );

  for m = [ 5, 11, 21 ]
    line_fekete_rule_test03 ( m );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FEKETE_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
