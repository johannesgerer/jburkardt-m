function prob_test0705 ( )

%*****************************************************************************80
%
%% TEST0705 tests FISHER_PDF and FISHER_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  n = 10;
  test_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0705\n' );
  fprintf ( 1, '  For the Fisher PDF:\n' );
  fprintf ( 1, '  FISHER_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  FISHER_SAMPLE samples the PDF.\n' );

  for test = 1 : test_num

    if ( test == 1 )
      kappa = 0.0;
      mu = [ 1.0, 0.0, 0.0 ];
    elseif ( test == 2 )
      kappa = 0.5;
      mu = [ 1.0, 0.0, 0.0 ];
    elseif ( test == 3 ) 
      kappa = 10.0;
      mu = [ 1.0, 0.0, 0.0 ];
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  PDF parameters:\n' );
    fprintf ( 1, '    Concentration parameter KAPPA =      %f\n', kappa );
    fprintf ( 1, '    Direction MU(1:3) = %f  %f  %f\n', mu(1:3) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '      X                         PDF\n' );
    fprintf ( 1, '\n' );

    seed = 123456789;

    [ x(1:3,1:n), seed ] = fisher_sample ( kappa, mu, n, seed );

    for j = 1 : n

      pdf = fisher_pdf ( x(1:3,j), kappa, mu );

      fprintf ( 1, '  %8f  %8f  %8f    %14f\n', x(1:3,j), pdf );

    end

  end

  return
end
