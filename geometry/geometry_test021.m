function geometry_test021 ( )

%*****************************************************************************80
%
%% TEST021 tests DIRECTION_PERT_3D, GET_SEED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 3;
  seed = 123456789;

  vbase(1:dim_num) =  [ 1.0,  0.0, 0.0 ];
  sigma(1:ntest) = [ 0.99, 0.5, 0.1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST021\n' );
  fprintf ( 1, '  DIRECTION_PERT_3D perturbs a direction vector.\n' );

  r8vec_print ( dim_num, vbase, '  The base vector:' );

  for itest = 1 : ntest

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using Sigma = %f\n', sigma(itest) );
    fprintf ( 1, '\n' );

    for i = 1 : 20
      [ vran, seed ] = direction_pert_3d ( sigma(itest), vbase, seed );
      fprintf ( 1, '  %10f  %10f  %10f\n', vran(1:dim_num) );
    end

  end

  return
end
