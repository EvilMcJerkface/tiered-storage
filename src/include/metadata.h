#ifndef __METADATA_H__
#define __METADATA_H__

// represents the replication state for each key
struct key_info {
  unordered_map<unsigned, unsigned> global_replication_map_;
  unordered_map<unsigned, unsigned> local_replication_map_;
};

// per-tier metadata
struct tier_data {
  tier_data() : thread_number_(1), default_replication_(1), node_capacity_(0) {}

  tier_data(unsigned t_num, unsigned rep, unsigned long long node_capacity)
    : thread_number_(t_num), default_replication_(rep), node_capacity_(node_capacity) {}

  unsigned thread_number_;

  unsigned default_replication_;

  unsigned long long node_capacity_;
};

#endif