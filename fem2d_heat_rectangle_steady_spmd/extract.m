function lab_nodes_local = extract(nodes_local, lab_begin, lab_end)

% Special routine for locating the nodes in node_local that correspond to
% columns on the lab. We rely on the fact that lab_cols are consecutive
% integers from lab_begin to lab_end (inclusive).

  lab_nodes_local = [];
  for kk = 1:length(nodes_local)
      if nodes_local(kk) >= lab_begin && nodes_local(kk) <= lab_end
          lab_nodes_local = [lab_nodes_local; kk nodes_local(kk)];
      end
  end

  return
end
