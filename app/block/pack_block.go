package block

import (
	"github.com/ethereum/go-ethereum/common/hexutil"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/itzmeanjan/ette/app/db"
	"github.com/itzmeanjan/ette/helper"
)

// BuildPackedBlock - Builds struct holding whole block data i.e.
// block header, block body i.e. tx(s), event log(s)
func BuildPackedBlock(block *types.Block, txs []*db.PackedTransaction) *db.PackedBlock {

	packedBlock := &db.PackedBlock{}

	packedBlock.Block = &db.Blocks{
		Hash:                block.Hash().Hex(),
		Number:              block.NumberU64(),
		Time:                block.Time(),
		ParentHash:          block.ParentHash().Hex(),
		Difficulty:          block.Difficulty().String(),
		GasUsed:             block.GasUsed(),
		GasLimit:            block.GasLimit(),
		Nonce:               hexutil.EncodeUint64(block.Nonce()),
		Miner:               block.Coinbase().Hex(),
		Size:                float64(block.Size()),
		StateRootHash:       block.Root().Hex(),
		UncleHash:           block.UncleHash().Hex(),
		TransactionRootHash: block.TxHash().Hex(),
		ReceiptRootHash:     block.ReceiptHash().Hex(),
		ExtraData:           block.Extra(),
	}
	packedBlock.Transactions = txs

	packedBlock.Block.TxsNumber = uint64(len(packedBlock.Transactions))

	_ = helper.UpdateMinerToSigner(packedBlock, block)

	return packedBlock

}
