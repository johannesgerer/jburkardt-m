function prob_test110 ( )

%*****************************************************************************80
%
%% TEST110 tests MULTINOMIAL_COEF1, MULTINOMIAL_COEF2.
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
  maxfactor = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST110\n' );
  fprintf ( 1, '  MULTINOMIAL_COEF1 computes multinomial\n' );
  fprintf ( 1, '    coefficients using the Gamma function;\n' );
  fprintf ( 1, '  MULTINOMIAL_COEF2 computes multinomial\n' );
  fprintf ( 1, '    coefficients directly.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 10 of the BINOMIAL table:\n' );
  fprintf ( 1, '\n' );

  n = 10;
  nfactor = 2;

  for i = 0 : n

    factor(1) = i;
    factor(2) = n - i;

    ncomb1 = multinomial_coef1 ( nfactor, factor );

    ncomb2 = multinomial_coef2 ( nfactor, factor );

    fprintf ( 1, '  %4d  %4d  %5d  %5d\n', factor(1), factor(2), ncomb1, ncomb2 );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Level 5 of the TRINOMIAL coefficients:\n' );

  n = 5;
  nfactor = 3;

  for i = 0 : n

    factor(1) = i;

    fprintf ( 1, '\n' );

    for j = 0 : n - factor(1)

      factor(2) = j;
      factor(3) = n - factor(1) - factor(2);

      ncomb1 = multinomial_coef1 ( nfactor, factor );

      ncomb2 = multinomial_coef2 ( nfactor, factor );

      fprintf ( 1, '  %4d  %4d  %4d  %5d  %5d\n', factor(1:3), ncomb1, ncomb2 );

    end

  end

  return
end
