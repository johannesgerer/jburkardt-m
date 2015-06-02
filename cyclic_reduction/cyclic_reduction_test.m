function cyclic_reduction_test ( )

%*****************************************************************************80
%
%% CYCLIC_REDUCTION_TEST tests the CYCLIC_REDUCTION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLIC_REDUCTION_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CYCLIC_REDUCTION library.\n' );

  cyclic_reduction_test01 ( );
  cyclic_reduction_test02 ( );
  cyclic_reduction_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLIC_REDUCTION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



