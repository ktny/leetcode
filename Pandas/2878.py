import pandas as pd


def getDataframeSize(players: pd.DataFrame) -> list[int]:
    rows, columns = players.shape
    return [rows, columns]

    # return [len(players), len(players.columns)]
