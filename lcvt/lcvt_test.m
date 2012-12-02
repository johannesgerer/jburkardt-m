function lcvt_test ( )

%*****************************************************************************80
%
%% LCVT_TEST calls a set of problems for LCVT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LCVT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LCVT library.\n' );
 
  for i = -1 : 2
    sample_function_cvt = i;
    lcvt_test01 ( sample_function_cvt );
  end

  lcvt_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LCVT_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
