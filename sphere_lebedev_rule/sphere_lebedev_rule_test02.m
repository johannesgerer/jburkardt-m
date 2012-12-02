function sphere_lebedev_rule_test02 ( )

%*****************************************************************************80
%
%% SPHERE_LEBEDEV_RULE_TEST02 tests the SPHERE_LEBEDEV_RULE functions.
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    Dmitri Laikov
%
%  Reference:
%
%    Vyacheslav Lebedev, Dmitri Laikov,
%    A quadrature formula for the sphere of the 131st
%    algebraic order of accuracy,
%    Russian Academy of Sciences Doklady Mathematics,
%    Volume 59, Number 3, 1999, pages 477-481.
%
  nmax = 65;
  mmax = floor ( ( nmax * 2 + 3 ) * ( nmax * 2 + 3 ) / 3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LEBEDEV_RULE_TEST02\n' );
  fprintf ( 1, '  Generate each available rule and test for accuracy.\n' );

  for n = 1 : nmax

    available = available_table ( n );

    if ( available == 1 )

      order = order_table ( n );

      [ x, y, z, w ] = ld_by_order ( order );

      s(0+1) = 1.0;
      for k = 1 : n + 1
        s(k+1) = ( 2 * k - 1 ) * s(k-1+1);
      end
%
%  For each abscissa X(M), compute the values 1, X(M)^2, X(M)^4, ..., X(M)^2*N.
%
      for m = 1 : order
        xn(m,1) = 1.0;
        yn(m,1) = 1.0;
        zn(m,1) = 1.0;
        for k = 1 : n
          xn(m,k+1) = xn(m,k-1+1) * x(m) * x(m);
          yn(m,k+1) = yn(m,k-1+1) * y(m) * y(m);
          zn(m,k+1) = zn(m,k-1+1) * z(m) * z(m);
        end
      end

      err_max = 0.0;
      for i = 0 : n
        for j = 0 : n - i
          k = n - i - j;
%
%  Apply Lebedev rule to x^2i y^2j z^2k.
%
          integral_approx = 0.0;
          for m = 1 : order
            integral_approx = integral_approx ...
              + w(m) * xn(m,i+1) * yn(m,j+1) * zn(m,k+1);
          end
%
%  Compute exact value of integral (aside from factor of 4 pi%).
%
          integral_exact = s(i+1) * s(j+1) * s(k+1) / s(1+i+j+k+1);
%
%  Record the maximum error for this rule.
%
          err = abs ( ( integral_approx - integral_exact ) / integral_exact );
          err_max = max ( err_max, err );

        end
      end

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Order = %4d  LMAXW = %4d  max error = %14e\n', ...
        order, precision_table ( n ), err_max );
%
%  Convert (X,Y,Z) to (Theta,Phi) and print the data.
%
      if ( order <= 50 )
        for m = 1 : order
          [ alpha, beta ] = xyz_to_tp ( x(m), y(m), z(m) );
          fprintf ( 1, '%24.15f%24.15f%24.14f\n', alpha, beta, w(m) );
        end
      end

    end

  end

  return
end
