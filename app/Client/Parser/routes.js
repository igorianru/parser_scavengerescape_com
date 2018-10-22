import Index from './Index/index';
import express from 'express'

const
	router = express.Router();

router.route('/parser/').get((req, res) => {Index.index(req, res)});
router.route('/parser/:date').get((req, res) => {Index.index(req, res)});
router.route('/parser/:date/:id').get((req, res) => {Index.index(req, res)});
router.route('/parser/:date/:id/:time').get((req, res) => {Index.index(req, res)});
export default router
