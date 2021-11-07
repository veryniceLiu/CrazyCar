﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Utils;

public class MatchDetailUI : MonoBehaviour {
    public MatchItem matchItem;
    public Transform itemParent;
    public Button backBtn;

    private void OnEnable() {
        // 数据在Homepage已经拉取过了
        UpdateUI();
    }

    private void UpdateUI() {
        Util.DeleteChildren(itemParent);
        foreach (var kvp in GameController.manager.matchManager.matchDic) {
            MatchItem item = Instantiate(matchItem);
            item.transform.SetParent(itemParent, false);
            item.SetContent(kvp.Value);
        }
    }

    private void Start() {
        backBtn.onClick.AddListener(() => {
            UIManager.manager.ShowPage(UIPageType.HomepageUI);
        });
    }
}