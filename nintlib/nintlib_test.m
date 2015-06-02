function nintlib_test ( )

%*****************************************************************************80
%
%% NINTLIB_TEST tests the NINTLIB library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINTLIB_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NINTLIB library.\n' );

  test_num = 3;

  dim_num_test = [ 2, 3, 4 ];

  a = 0.0;
  b = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TESTND\n' );
  fprintf ( 1, '  Test routines for estimating the integral of\n' );
  fprintf ( 1, '  of F(X) in the hypercube [A,B]^DIM_NUM.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    dim_num = dim_num_test(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  DIM_NUM = %8d\n', dim_num );
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  A(1:DIM_NUM) = %f\n', a );
    fprintf ( 1, '  B(1:DIM_NUM) = %f\n', b );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = 1\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @f1dn );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = sum ( X(1:DIM_NUM) )\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @fxdn );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = sum( X(1:DIM_NUM)^2 )\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @fx2dn );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = sum ( X(1:DIM_NUM)^3 )\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @fx3dn );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = exp(sum(X(1:DIM_NUM)))\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @fedn );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X(1:DIM_NUM)) = 1/(1+sum(X(1:DIM_NUM)^2))\n' );
    fprintf ( 1, '\n' );

    nintlib_testnd ( dim_num, @fbdn );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NINTLIB_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

