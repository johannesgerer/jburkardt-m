  function val = steps(y, yh, ep, vh)

% Evaluate a step function with value vh(i)
% for y in an ep(i) nbhd of yh(i)
% yh, ep( > 0) and v all have the same length

  if length(y) == 1 
    val = sum(vh(:).*(y-ep(:) <= yh(:)).*(y+ep(:) >= yh(:)));
  else
     val = zeros(length(y),1);
     for jj=1:length(y)
        val(jj)=sum(vh(:).*(y(jj)-ep(:) <= yh(:)).*(y(jj)+ep(:) >= yh(:)));
     end
  end

  return
end
