package com.vms.app.service;

import java.util.Map;

import com.vms.app.entity.User;

public interface UserService {
  public String join(User user);

  public Map<String, Object> getUserInfo(String ID);

}
