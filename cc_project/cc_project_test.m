function cc_project_test ( )

%*****************************************************************************80
%
%% CC_PROJECT_TEST tests the CC_PROJECT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_PROJECT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
%
%  Compare various rules for [-1,+1] against Boyd's FF rule.
%
  n = 5;
  compare_ff_test ( n );
%
%  Look at the cardinal cosine and sine functions.
%
  cardinal_cos_test ( );
  cardinal_sin_test ( );
  cardinal_test ( );
%
%  Tabulate a few of the rules.
% 
  ccff_tabulate ( );
  ccfi_0_tabulate ( );
  ccfi_1_tabulate ( );
  ccii_0_tabulate ( );
  ccii_1_tabulate ( );
%
%  The CCFF rules are exact for monomials.
%  The CCFI rules are NOT exact for monomials.
%  The CCII rules are NOT exact for monomials.
%
  ccff_exactness ( );
  ccfi_0_exactness ( );
  ccfi_1_exactness ( );
%
%  Look at the error behavior as N increases.
%
  ccff_asymptotic_test ( );
  ccfi_0_asymptotic_test ( );
  ccfi_1_asymptotic_test ( );
  ccii_asymptotic_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CC_PROJECT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

