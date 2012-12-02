function interp_test ( code )

%*****************************************************************************80
%
%% INTERP_TEST tests the interpolation property of an element.
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
%  Parameters:
%
%    Input, string CODE, identifies the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 
%    'T3', 'T4', 'T6' and 'T10'.
%
  test_num = 5;

  if ( s_eqi ( code, 'T4' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INTERP_TEST - Warning!\n' );
    fprintf ( 1, '  Skipping test for element "T4".\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INTERP_TEST for element "%s".\n', code );

  element_order = order_code ( code );

  fprintf ( 1, '  Element order = %d\n', element_order );
%
%  Get the coordinates of the reference nodes.
%
  [ node_r, node_s, area ] = node_reference ( code );
%
%  Get the monomial exponents for which the element is exact.
%
  [ rexp, sexp ] = poly ( code );

  seed = 123456789;

  for i = 1 : element_order

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Interpolate R^%d * S^%d\n', rexp(i), sexp(i) );
    fprintf ( 1, '\n' );
%
%  Evaluate R**REXP(I) * S**SEXP(I) at the nodes.  This is our data.
%
    for node = 1 : element_order

      r = node_r(node);
      s = node_s(node);

      if ( rexp(i) == 0 )
        r_factor = 1.0;
      else
        r_factor = r^rexp(i);
      end

      if ( sexp(i) == 0 )
        s_factor = 1.0;
      else
        s_factor = s^sexp(i);
      end

      node_u(node) = r_factor * s_factor;

      fprintf ( 1, '  (R,S,U):  %10f  %10f  %10f\n', r, s, node_u(node) );
    end
%
%  Now pick random points in the element, and compute the interpolated
%  value of R**REXP(*) * S**SEXP(I) there.  Mathematically, these
%  values should be exact.
%
    for test = 1 : test_num

      [ r, s, seed ] = reference_sample ( code, seed );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  (R,S):  %10f  %10f\n', r, s );

      u_exact = r8_power ( r, rexp(i) ) * r8_power ( s, sexp(i) );

      dudr_exact = rexp(i) * r8_power ( r, rexp(i) - 1 ) * r8_power ( s, sexp(i) );

      duds_exact = r8_power ( r, rexp(i) ) * sexp(i) * r8_power ( s, sexp(i) - 1 );

      [ u, dudr, duds ] = interp ( code, element_order, r, s, node_u );

      fprintf ( 1, '  (U,U*,Error):   %10f  %10f  %10f\n', ...
        u_exact, u, abs ( u_exact - u ) );
      fprintf ( 1, '  (Ur,Ur*,Error): %10f  %10f  %10f\n', ...
        dudr_exact, dudr, abs ( dudr_exact - dudr ) );
      fprintf ( 1, '  (Us,Us*,Error): %10f  %10f  %10f\n', ...
        duds_exact, duds, abs ( duds_exact - duds ) );

    end

  end

  return
end
