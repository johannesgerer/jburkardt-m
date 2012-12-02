function mean = dirichlet_mix_mean ( comp_max, comp_num, elem_num, a, ...
  comp_weight )

%*****************************************************************************80
%
%% DIRICHLET_MIX_MEAN returns the means of a Dirichlet mixture PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COMP_MAX, the leading dimension of A, which must
%    be at least COMP_NUM.
%
%    Input, integer COMP_NUM, the number of components in the Dirichlet
%    mixture density, that is, the number of distinct Dirichlet PDF's
%    that are mixed together.
%
%    Input, integer ELEM_NUM, the number of elements of an observation.
%
%    Input, real A(COMP_MAX,ELEM_NUM), the probabilities for element ELEM_NUM
%    in component COMP_NUM.
%    Each A(I,J) should be greater than or equal to 0.0.
%
%    Input, integer COMP_WEIGHT(COMP_NUM), the mixture weights of the densities.
%    These do not need to be normalized.  The weight of a given component is
%    the relative probability that that component will be used to generate
%    the sample.
%
%    Output, real MEAN(ELEM_NUM), the means for each element.
%

%
%  Check.
%
  for comp_i = 1 : comp_num

    for elem_i = 1 : elem_num
      if ( a(comp_i,elem_i) < 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DIRICHLET_MIX_MEAN - Fatal error!\n' );
        fprintf ( 1, '  A(COMP,ELEM) < 0.\n' );
        fprintf ( 1, '  COMP = %d\n', comp_i );
        fprintf ( 1, '  ELEM = %d\n', elem_i );
        fprintf ( 1, '  A(COMP,ELEM) = %f\n', a(comp_i,elem_i) );
        error ( 'DIRICHLET_MIX_MEAN - Fatal error!' )
      end
    end

  end

  comp_weight_sum = sum ( comp_weight(1:comp_num) );

  for comp_i = 1 : comp_num
    a_sum(comp_i) = 0.0;
    for elem_i = 1 : elem_num
      a_sum(comp_i) = a_sum(comp_i) + a(comp_i,elem_i);
    end
  end

  for elem_i = 1 : elem_num
    mean(elem_i) = 0.0;
    for comp_i = 1 : comp_num
      mean(elem_i) = mean(elem_i) + comp_weight(comp_i) * a(comp_i,elem_i) ...
        / a_sum(comp_i);
    end
    mean(elem_i) = mean(elem_i) / comp_weight_sum;
  end

  return
end
